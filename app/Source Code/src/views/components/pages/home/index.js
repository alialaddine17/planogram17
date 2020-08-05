import React, { useEffect, useState } from "react";

//Material UI Components
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import InputBase from "@material-ui/core/InputBase";
import IconButton from "@material-ui/core/IconButton";
import SearchIcon from "@material-ui/icons/Search";
import Menu from "@material-ui/core/Menu";
import MenuItem from "@material-ui/core/MenuItem";
import PopupState, { bindTrigger, bindMenu } from "material-ui-popup-state";
import PublicIcon from "@material-ui/icons/Public";
import * as Service from "../service";
import { CircularProgress } from "@material-ui/core";
import Error from "../../error";

const useStyles = makeStyles((theme) => ({
  paper: {
    padding: "40px 16px",
    textAlign: "center",
    color: theme.palette.text.secondary,
    margin: "5px 5px 0px 0px",
  },
  root: {
    padding: "2px 4px",
    display: "flex",
    alignItems: "center",
    width: "100%",
  },
  input: {
    marginLeft: theme.spacing(1),
    flex: 1,
  },
  iconButton: {
    padding: 10,
  },
}));

export default function Home(props) {
  document.body.classList.add("home");

  const classes = useStyles();
  const [categories, setCategories] = useState([]);
  const [error, setErroMessage] = useState({});
  const [rtlValue, setRtlValue] = useState("en");
  const [loading, setLoading] = useState(false);
  const [title, setTitle] = useState("");
  const [blankData, setblankData] = useState("");
  const [searchData, searchResult] = useState("");

  function redirect(id, string) {
    if(string) {
      props.history.push("/home/category/" + id + "?"+string);
    } else {
      props.history.push("/home/category/" + id)
    }
  }

  function rtlValues(rtlValue, popupState) {
    localStorage.setItem("language", rtlValue);
    setRtlValue(rtlValue);
    popupState.close();
    props.setRtl(rtlValue === "ur" ? "rtl" : "");
  }

  function getSearchData(searchData) {
    localStorage.setItem("search", searchData);
    setLoading(true);
    searchResult("");
    Service.get("search", searchData).then((res) => {
      if (
        res.data.data.categoryData !== null &&
        res.data.data.categoryData !== undefined &&
        res.data.data.categoryData !== ""
      ) {
        setLoading(false);
        redirect(res.data.data.categoryData[0].id);
      } else {
        if (res.data.data.SubCategoryData) {
          setLoading(false);
          redirect(res.data.data.SubCategoryData[0].parentid,"subCatId="+res.data.data.SubCategoryData[0].id);
        } else {
          setLoading(false);
          searchResult("No data found");
          setTimeout(() => {
            searchResult("");
          }, 3000);
        }
      }
    });
  }

  useEffect(() => {
    if (localStorage.getItem("language")) {
      setRtlValue(localStorage.getItem("language"));
    }
    if (localStorage.getItem("search") !== "") {
      setTitle(localStorage.getItem("search"));
    }
    setLoading(true);
    Service.get("categories", "")
      .then((res) => {
        if (res.data.data.content.length > 0) {
          setCategories(res.data.data.content);
          setLoading(false);
        } else {
          setblankData("No data Found");
          setLoading(false);
        }
      })
      .catch((error) => {
        setLoading(false);
        setErroMessage(error);
      });
  }, []);

  return (
    <div>
      <div className="row m-0 loader align-items-center" hidden={!loading}>
        <div className="col-12 text-center">
          <CircularProgress color="secondary" />
        </div>
      </div>

      <div
        className="row m-0 loader align-items-center"
        hidden={!error.message}
      >
        <div className="col-12 text-center">
          <Error value={error.message} />
        </div>
      </div>

      <div className="row m-0 loader align-items-center" hidden={!blankData}>
        <div className="col-12 text-center">{blankData}</div>
      </div>

      <div className="container-fluid homeheader">
        <div className="row">
          <div className="col-10">
            <Paper component="form" className={classes.root}>
              <IconButton
                type="button"
                className={classes.iconButton}
                aria-label="search"
                onClick={() => getSearchData(title)}
              >
                <SearchIcon />
              </IconButton>
              <InputBase
                value={title}
                className={classes.input}
                placeholder={
                  localStorage.getItem("language") === "en"
                    ? "Planogram quick search"
                    : "پلانگگرام فوری تلاش"
                }
                inputProps={{ "aria-label": "Planogram quick search" }}
                onChange={(event) => {
                  setTitle(event.target.value);
                  localStorage.setItem("search", event.target.value);
                }}
                onKeyPress={(event) => {
                  if (event.key === "Enter") {
                    event.preventDefault();
                    getSearchData(title);
                  }
                }}
              />
            </Paper>
          </div>

          <div className="col-2 p-0 multilang">
            <PopupState variant="popover" popupId="demo-popup-menu">
              {(popupState) => (
                <React.Fragment>
                  <IconButton
                    color="primary"
                    aria-label="add an alarm"
                    {...bindTrigger(popupState)}
                  >
                    <PublicIcon />
                  </IconButton>
                  <Menu {...bindMenu(popupState)}>
                    <MenuItem onClick={() => rtlValues("en", popupState)}>
                      English
                    </MenuItem>
                    <MenuItem onClick={() => rtlValues("ur", popupState)}>
                      Urdu
                    </MenuItem>
                  </Menu>
                </React.Fragment>
              )}
            </PopupState>
          </div>
        </div>
      </div>

      <div className="mt-3 mb-4">
        <div className="row m-0">
          <div className="col-12" hidden={searchData === ""}>
            <div className="alert alert-info text-center">{searchData}</div>
          </div>
          {categories.map((category, index) => (
            <div className="col-12 mb-1" key={index}>
              <div
                className="category-box "
                onClick={() => redirect(category.id)}
              >
                <h4>{category["title_" + rtlValue]}</h4>
                <img src={category.catImg} alt="" className="category-pic" />
                <img
                  src="/assets/images/right-arroe.svg"
                  alt=""
                  className="arrow"
                />
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
  );
}
