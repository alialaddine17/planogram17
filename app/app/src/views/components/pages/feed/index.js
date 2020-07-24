import React from 'react';
import Header from '../../header';
import Button from '@material-ui/core/Button';
import * as Service from '../service';
import { CircularProgress } from '@material-ui/core';
import Error from '../../error';

class Feed extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            expanded: 0,
            errorMsg: null,
            lang: localStorage.getItem('language'),
            loading: false,
            announcement: [],
            id: this.props.match.params.id,
            blankData: null,
            pdfError:null
        }
    }


    componentDidMount() {
        this.getAnnouncement();
    }

    getAnnouncement() {
        this.setState({
            loading: true
        })
        Service.get('announcement', "").then(res => {
            if (res.data.data.content.length > 0) {
                this.setState({
                    announcement: res.data.data.content,
                    loading: false
                })
            } else {
                this.setState({
                    loading: false,
                    blankData: 'No data found'
                })
            }

        }).catch(error => {
            console.error(error.message);
            this.setState({
                errorMsg: error.message,
                loading: false
            });
        });
    }

    downloadPdf(url) {
        Service.getFile(url).then((response) => response.data)
            .then((blob) => {
                const durl = window.URL.createObjectURL(new Blob([blob], { type: 'application/octet-stream .pdf' }));
                const link = document.createElement('a');
                link.href = durl;
                let name = new Date();
                link.setAttribute('download', name.getTime() + ".pdf");
                document.body.appendChild(link);
                link.click();
                link.parentNode.removeChild(link);
            })
            .catch((error) => {
                this.setState({
                    pdfError: 'Unable to download file'
                })
            });
    }

    render() {
        return (
            <div className="insights-block">
                <Header heading='Good Read' goBack={false} />
                <div className="row m-0 loader align-items-center" hidden={!this.state.loading}>
                    <div className="col-12 text-center">
                        {this.state.loading ? <CircularProgress color="secondary" /> : null}
                    </div>
                </div>

                <div className="row m-0 loader align-items-center" hidden={!this.state.errorMsg}>
                    <div className="col-12 text-center">
                        <Error value={this.state.errorMsg} />
                    </div>
                </div>

                <div className="row m-0 loader align-items-center" hidden={!this.state.blankData}>
                    <div className="col-12 text-center">
                        {this.state.blankData}
                    </div>
                </div>

                {this.state.announcement.map((announcement, index) => (
                    <div className="m-3 insights-main" key={index}>
                        <div className="insights-card">
                            <h2>{announcement['anouncementTitle_' + this.state.lang]}</h2>
                            <img src={announcement.anouncementImg} alt="" className="img-fluid" />
                            <p dangerouslySetInnerHTML={{ __html: announcement['description_' + this.state.lang] }}></p>
                            {/* {announcement.pdf != null ? <Button onClick={() => this.downloadPdf(announcement.pdf)} className="btn btn-red btn-small" variant="contained" color="primary">Download PDF</Button>
                                : ''} */}
                                 {announcement.pdf != null ? <a href={announcement.pdf} target="_blank" className="btn btn-red btn-small" variant="contained" color="primary">{announcement.downloadBtnTxt ? announcement.downloadBtnTxt : "Download PDF" }</a>
                                : ''}
                            {announcement.pdf != null ? <p className="text-danger">{this.state.pdfError}</p> : ''}   
                        </div>
                    </div>
                ))}
            </div>
        );
    }
}

export default Feed;