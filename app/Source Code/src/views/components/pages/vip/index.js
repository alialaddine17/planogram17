import React, { useEffect, useState } from 'react';

//Material UI Components
import { makeStyles } from '@material-ui/core/styles';
import Button from '@material-ui/core/Button';
import * as service from '../service';
import Error from '../../error';
import KeyboardBackspaceIcon from '@material-ui/icons/KeyboardBackspace';
import { CircularProgress } from '@material-ui/core';


const useStyles = makeStyles(theme => ({
    paper: {
        padding: "40px 16px",
        textAlign: 'center',
        color: theme.palette.text.secondary,
        margin: "5px 5px 0px 0px"
    },
    root: {
        padding: "2px 4px",
        display: "flex",
        alignItems: "center",
        width: "100%"
    },
    input: {
        marginLeft: theme.spacing(1),
        flex: 1
    },
    iconButton: {
        padding: 10
    },
}));

export default function VIP() {
    document.body.classList.add("no-header");
    const classes = useStyles();
    const [vip, setVip] = useState([]);
    const [error, setErrorMessage] = useState({});
    const [language, setLanguage] = useState(localStorage.getItem('language'))
    const [loading, setLoading] = useState(false);
    const [blankData, setblankData] = useState('');
    const [vipsetting, setVipSetting] = useState([]);


    useEffect(() => {
        setLoading(true);
        service.get('vip', "").then(res => {
            if (res.data.data.content.length > 0) {
                setVip(res.data.data.content);
                setLoading(false);
            } else {
                setblankData('No data Found');
                setLoading(false);
            }

        }).catch(error => {
            setLoading(false);
            console.error(error.message);
            setErrorMessage(error);
        });
        service.get('vip-setting', "").then(res => {
            if (res.data.data.content.length > 0) {
                setVipSetting(res.data.data.content);
            } else {
                setblankData('No Data Found');
            }
        })
    }, []);

    return (
        <div className="row m-0">
            <div className="col-12 mt-5 text-center">
                <img src="assets/images/redbull-vip.png" className="img-fluid" alt="Logo" width="150" />
            </div>
            {vipsetting.map((vipsettings,index) => (
                <div className="col-12 mt-4 pt-2 text-center mb-3" key={index}>
                    <img src={vipsettings.vipImg} className="img-fluid mb-2" alt="" width="170" />
                    <p dangerouslySetInnerHTML={{ __html: vipsettings['description_' + language]}}></p>
                </div>
            ))}

            <div className="col-12">
                <div className="row">

                    <div className="row m-0 loader align-items-center" hidden={!loading}>
                        <div className="col-12 text-center">
                            <CircularProgress color="secondary" />
                        </div>
                    </div>

                    <div className="row m-0 loader align-items-center" hidden={!error.message}>
                        <div className="col-12 text-center">
                            <Error value={error.message} />
                        </div>
                    </div>

                    <div className="row m-0 loader align-items-center" hidden={!blankData}>
                        <div className="col-12 text-center">
                            {blankData}
                        </div>
                    </div>


                    {vip.map((vip, index) => (
                        <div className="col-12 mb-4" key={index}>
                            <Button className="w-100 btn btn-blue category-btn" variant="contained" color="primary" href={"/#/home/vipcategory/" + vip.id}> {vip['title_' + language]} {<KeyboardBackspaceIcon className="vip-icon rotate180deg" />}</Button>
                        </div>
                    ))}
                </div>
            </div>
        </div>
    );
}
