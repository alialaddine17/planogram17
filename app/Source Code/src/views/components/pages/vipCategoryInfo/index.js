import React, { useState, useEffect } from "react";
import { makeStyles } from "@material-ui/core/styles";
import Paper from "@material-ui/core/Paper";
import * as Service from "../service";
import Header from "../../header";
import { CircularProgress } from "@material-ui/core";
import Error from "../../error";

const useStyles = makeStyles({
  root: {
    width: "100%",
  },
  container: {
    maxHeight: 440,
    margin: "10px 5px",
    maxWidth: "100%",
  },
});

export default function StickyHeadTable(props) {
  const classes = useStyles();
  const [loading, setLoading] = useState(false);
  const [error, setErroMessage] = useState({});
  const [blankData, setblankData] = useState("");
  const [vipCategories, setVipCategories] = useState([]);
  const [title, setTitle] = useState([]);

  useEffect(() => {
    setLoading(true);
    Service.get("vip", "")
      .then((res) => {
        if (res.data.data.content.length > 0) {
          let object = res.data.data.content.find(
            (obj) => obj.id == props.match.params.id
          );
          setTitle(object["title_" + localStorage.getItem("language")]);
          if (object["description_" + localStorage.getItem("language")]) {
            setVipCategories(
              object["description_" + localStorage.getItem("language")]
            );
            setLoading(false);
          } else {
            setblankData("No data Found");
            setLoading(false);
          }
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
    <div className="vip-category-table">
      <Paper className={classes.root}>
        <Header
          heading={title}
          {...props}
          backTo={"/home/vipcategory/" + props.match.params.id}
          goBack={true}
        />

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

        <div
          className="table-responsive"
          dangerouslySetInnerHTML={{ __html: vipCategories }}
        ></div>
      </Paper>
    </div>
  );
}
