import React from 'react';
import { createHashHistory } from 'history'
import { HashRouter, Route, Switch } from "react-router-dom";
import Language from './components/pages/multi_language';
import Pages from './components/pages';

class MainApp extends React.Component {

    constructor(props) {
        super(props);
    }

    componentDidMount() {
        if (!localStorage.getItem('language')) {
            localStorage.setItem('language', 'en')
        }
    }

    render() {
        const history = createHashHistory();
        return (
     
                <HashRouter history={history} basename={process.env.PUBLIC_URL}>
                    <Switch>
                        <Route exact path="/" component={(props) => <Language {...props} setRtl={(value) => this.props.setRtl(value)} />} />
                        <Route path="/home" component={(props) => <Pages {...props} setRtl={(value) => this.props.setRtl(value)} />} />
                    </Switch>
                </HashRouter>
          
        )
    }
}

export default MainApp;