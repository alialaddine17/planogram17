import React, { useState, useEffect } from "react";
import Button from '@material-ui/core/Button';
import * as Service from "../service";


//Image
// import HomepageLogo from '';

export default function Language(props) {

    let [details, setDetails] = useState([{},{},{}])

    useEffect(() => {
        Service.get("generalSettings", "").then(response=> {
            setDetails(response.data.data);            
        })
    }, []);

    function rtlValues(rtlValue) {
        localStorage.setItem('language', rtlValue);
        props.setRtl(rtlValue === 'ur' ? 'rtl' : '');
        props.history.push('/home/');

    }

    return (
        
        <div className="splash-screen d-flex align-items-center">
            <div className="row mx-auto">
                <div className="col-12">
                    <img src="/assets/images/logo.png" className="mx-auto d-block img-fluid splash-screen-logo" alt="Logo" />
                    <p className="text-center splash-title-01">{details[0].value}</p>
                    <p className="text-center splash-title-02">{details[1].value}</p>
                </div>
                <div className="col-12 splash-btn">
                    <div className="row">
                        <div className="col-8 mx-auto">
                            <Button className="w-100 mb-3 btn" variant="contained" color="primary" onClick={() => rtlValues('en')}><img src="/assets/images/uk.svg" alt="" className="img-fluid" width="28" /> English</Button>
                            <Button className="w-100 btn" variant="contained" color="primary" onClick={() => rtlValues('ur')}><img src="/assets/images/india.svg" alt="" className="img-fluid" width="28" /> Urdu</Button>
                        </div>
                    </div>
                </div>
                <div className="col-12">
                    <p className="text-center to-start">{details[2].value}</p>
                </div>
            </div>
        </div>
    )
}
