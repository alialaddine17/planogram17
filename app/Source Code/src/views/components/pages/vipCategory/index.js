import React from 'react';
import Header from '../../header';
import { IconButton } from '@material-ui/core';
import * as Service from '../service';
import Error from '../../error';
import { CircularProgress } from '@material-ui/core';
import ModalImage from "react-modal-image";

class VIPCategory extends React.Component {
    constructor(props) {
        super(props);
        this.state = {
            id: this.props.match.params.id,
            subCategory: [],
            lang: localStorage.getItem('language'),
            category: "",
            errMsg: null,
            loading: false,
            blankData: null
        }
    }

    rightSide() {
        return <IconButton aria-label="delete" href={"/#/home/vipcategoryinfo/" + this.state.id} >
            <img src="/assets/images/gift-icon.svg" className="img-fluid" alt="" />
        </IconButton>
    }

    componentDidMount() {
        this.getVIPCategory();
    }

    getVIPCategory() {
        this.setState({
            loading: true
        })
        Service.getById('vip-details', this.state.id, "").then(res => {
            if (res.data.data.content) {
                this.setState({
                    subCategory: res.data.data.content,
                    category: res.data.data.content[0]['title_' + this.state.lang],
                    loading: false
                });
            } else {
                this.setState({
                    loading: false,
                    blankData: 'No data found'
                })
            }
        }).catch(error => {
            console.error(error.message);
            this.setState({
                loading: false,
                errMsg: error.message
            })
        });
    }

    render() {
        return (
            <div>
                <Header heading={"VIP " + this.state.category} {...this.props} backTo="/home/vip" goBack={true} rightSide={this.rightSide()} />
                <div className="row m-0 d-flex h-100 align-items-center position-absolute mx-auto w-100">

                    <div className="row m-0 loader align-items-center" hidden={!this.state.loading}>
                        <div className="col-12 text-center">
                            {this.state.loading ? <CircularProgress color="secondary" /> : null}
                        </div>
                    </div>

                    <div className="row m-0 loader align-items-center" hidden={!this.state.errMsg}>
                        <div className="col-12 text-center">
                            <Error value={this.state.errMsg} />
                        </div>
                    </div>

                    <div className="row m-0 loader align-items-center" hidden={!this.state.blankData}>
                        <div className="col-12 text-center">
                            {this.state.blankData}
                        </div>
                    </div>


                </div>
                <div className="m-3 vip-cat-block">
                    {
                        this.state.subCategory.map((subCategory, index) => (
                            <div className="row text-center" key={index}>
                                <div className="col-12">
                                    <h2>{subCategory['subTitle_' + this.state.lang]}</h2>
                                    <span className="indexNumber">#{index + 1}</span>
                                </div>
                                <div className="col-12">
                                    <div className="vip-cat-content">

                                        <h3>{subCategory['detailTitle_' + this.state.lang]}</h3>
                                        {/* <img src={subCategory.vipImg} className="img-fluid mb-3" alt="" /> */}
                                        <ModalImage small={subCategory.vipImg} large={subCategory.vipImg} alt="" className="img-fluid mb-3" hideDownload={true}
                                            hideZoom={true} />
                                        <p dangerouslySetInnerHTML={{ __html: subCategory['description_' + this.state.lang] }} />
                                    </div>
                                </div>
                            </div>
                        ))
                    }
                </div>
            </div>
        );
    }
}

export default VIPCategory;