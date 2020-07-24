import React from 'react';
import Footer from '../footer';
import Home from '../pages/home';
import VIP from '../pages/vip';
import Feed from '../pages/feed';
import Category from '../pages/category';
import { Route } from "react-router-dom";
import VIPCategory from '../pages/vipCategory';
import VIPCategoryInfo from '../pages/vipCategoryInfo';

class MainApp extends React.Component {

    constructor(props) {
        super(props);
        this.state = {
            networkFlag: false
        }
    }

    componentDidMount() {
        if (!localStorage.getItem('language')) {
            localStorage.setItem('language', 'en')
        }
        this.setState({
            networkFlag: !window.navigator.onLine
        });
        
        
        /*  window.addEventListener('offline', (e) => {
            this.setState({
                networkFlag: true
            });
        });
        window.addEventListener('online', (e) => {
            window.location.reload();
        }); */
    }
    
    render() {
        document.body.classList.remove("home");
        document.body.classList.remove("no-header");
        return (
            <React.Fragment>
                {/* <div hidden={!this.state.networkFlag} className="alert alert-warning m-2">You are offline</div> */}
                <div className="mh-body">
                    <Route exact path="/home" component={(props) => <Home {...props} setRtl={(value) => this.props.setRtl(value)} />} />
                    <Route path="/home/category/:id" component={Category} />
                    <Route path="/home/feed" component={Feed} />
                    <Route path="/home/vip" component={VIP} />
                    <Route path="/home/vipcategory/:id" component={VIPCategory} />
                    <Route path="/home/vipcategoryinfo/:id" component={VIPCategoryInfo} />
                </div>
                <div className="fixed-bottom w-100">
                    <Footer history={this.props.history} />
                </div>
            </React.Fragment>
        )
    }
}

export default MainApp;