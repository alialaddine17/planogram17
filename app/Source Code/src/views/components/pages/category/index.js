import React from "react";
import { withStyles } from "@material-ui/core/styles";
import MuiExpansionPanel from "@material-ui/core/ExpansionPanel";
import MuiExpansionPanelSummary from "@material-ui/core/ExpansionPanelSummary";
import MuiExpansionPanelDetails from "@material-ui/core/ExpansionPanelDetails";
import KeyboardBackspaceIcon from "@material-ui/icons/KeyboardBackspace";
import ExpandMoreIcon from "@material-ui/icons/ExpandMore";
import Header from "../../header";
import * as Service from "../service";
import Error from "../../error";
import { CircularProgress } from "@material-ui/core";
import ModalImage from "react-modal-image";

const ExpansionPanel = withStyles({
  root: {},
  expanded: {},
})(MuiExpansionPanel);

const ExpansionPanelSummary = withStyles({
  root: {
    backgroundColor: "rgba(0, 0, 0, .05)",
    minHeight: 56,
    "&$expanded": {
      minHeight: 56,
    },
  },
  content: {
    margin: "10px 0px",
    "&$expanded": {
      margin: "10px 0px !important",
    },
  },
})(MuiExpansionPanelSummary);

const ExpansionPanelDetails = withStyles((theme) => ({
  root: {
    padding: theme.spacing(2),
  },
}))(MuiExpansionPanelDetails);

class Category extends React.Component {
  constructor(props) {
    super(props);
    this.state = {
      expanded: 0,
      errorMsg: null,
      lang: localStorage.getItem("language"),
      loading: false,
      category: {
        subCategory: [],
      },
      id: this.props.match.params.id,
    };
  }

  componentDidMount() {
    this.getSubCategory();
  }

  preventOnClick(event) {
    event.preventDefault();
  }

  getSubCategory() {
    this.setState({
      loading: true,
    });
    Service.getById("sub-categories", this.state.id, "")
      .then((res) => {
        let category = null;
        res.data.data.content.map((data) => {
          if (!category) {
            category = data.category;
            category.subCategory = [];
          }
          category.subCategory.push(data.category["sub-category"]);
        });
        const params = new URLSearchParams(this.props.location.search);
        const subCatId = Number(params.get("subCatId"));
        this.setState({
          expanded: subCatId ? subCatId : category.subCategory[0].subCatId,
          category: category,
          loading: false,
        });
        if(subCatId) {
            var elmnt = document.getElementById(subCatId);
            elmnt.scrollIntoView({behavior: "smooth", block: "nearest", inline: "start"});
        }
        
      })
      .catch((error) => {
        console.error(error.message);
        this.setState({
          errorMsg: error.message,
          loading: false,
        });
      });
  }

  handleChange(expanded) {
    this.setState({
      expanded: expanded === this.state.expanded ? null : expanded,
    });
  }

  render() {
    const expanded = this.state.expanded;

    return (
      <div>
        <Header
          heading={this.state.category["title_" + this.state.lang]}
          {...this.props}
          backTo="/home"
          goBack={true}
        />
        <div className="m-3 category-accordion">
          <div
            className="row m-0 loader align-items-center"
            hidden={!this.state.loading}
          >
            <div className="col-12 text-center">
              {this.state.loading ? (
                <CircularProgress color="secondary" />
              ) : null}
            </div>
          </div>

          <div
            className="row m-0 loader align-items-center"
            hidden={!this.state.errorMsg}
          >
            <div className="col-12 text-center">
              <Error value={this.state.errorMsg} />
            </div>
          </div>

          {this.state.category.subCategory.map((subCat, index) => {
            return (
              <ExpansionPanel
                key={subCat.subCatId}
                id={subCat.subCatId}
                expanded={expanded === subCat.subCatId}
                onChange={() => this.handleChange(subCat.subCatId)}
              >
                <ExpansionPanelSummary
                  aria-label="Expand"
                  id="panel1d-header"
                  expandIcon={<ExpandMoreIcon />}
                >
                  <h2>{subCat["title_" + this.state.lang]}</h2>
                  <p>{subCat["subTitle_" + this.state.lang]}</p>
                </ExpansionPanelSummary>
                <ExpansionPanelDetails className="bg-grey">
                  {subCat.products ? (
                    subCat.products.map((product) => {
                      return (
                        <div
                          className="row text-center mt-3"
                          key={product.productId}
                        >
                          <div className="col-12">
                            <h3>{product["title_" + this.state.lang]}</h3>
                            <p>{product["productDesc_" + this.state.lang]}</p>
                            <ModalImage
                              small={product.productImg}
                              large={product.productImg}
                              alt=""
                              className="img-fluid"
                              hideDownload={true}
                              hideZoom={true}
                            />
                          </div>
                          <div className="col-12 mt-2">
                            <p>
                              {product.trafficFlow ? (product.trafficFlow === 0 ? (
                                <a
                                  href="#"
                                  onClick={(e) => this.preventOnClick(e)}
                                >
                                  {
                                    <KeyboardBackspaceIcon className="traffic-icon mr-1" />
                                  }{" "}
                                  {this.state.lang === "en"
                                    ? "Traffic flow"
                                    : "ٹریفک کا بہاو"}{" "}
                                </a>
                              ) : (
                                <a
                                  href="#"
                                  onClick={(e) => this.preventOnClick(e)}
                                >
                                  {this.state.lang === "en"
                                    ? "Traffic flow"
                                    : "ٹریفک کا بہاو"}{" "}
                                  {
                                    <KeyboardBackspaceIcon className="traffic-icon ml-1 rotate180deg" />
                                  }
                                </a>
                              )) : null}
                            </p>

                            {product.label  ?  (
                              <img
                                src={product.label}
                                className="img-fluid planogram-img"
                                width="46"
                              />
                            ) : null}
                          </div>
                        </div>
                      );
                    })
                  ) : (
                    <div></div>
                  )}
                </ExpansionPanelDetails>
              </ExpansionPanel>
            );
          })}
        </div>
      </div>
    );
  }
}

export default Category;
