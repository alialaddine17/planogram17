import React from 'react';
import { makeStyles } from '@material-ui/core/styles';
import AppBar from '@material-ui/core/AppBar';
import Toolbar from '@material-ui/core/Toolbar';
import Typography from '@material-ui/core/Typography';
import IconButton from '@material-ui/core/IconButton';
import KeyboardBackspaceIcon from '@material-ui/icons/KeyboardBackspace';

const useStyles = makeStyles(theme => ({
  root: {
    flexGrow: 1,
  },
  menuButton: {
    marginRight: theme.spacing(2),
  },
  title: {
    flexGrow: 1,
    textAlign: 'center'
  },
}));

export default function Header(props) {
  const classes = useStyles();

  function goBack() {
    props.history.push(props.backTo);
  }

  return (
    <div className="container-fluid category-detail-header">
      <div className="row">
        <div className="col-12">
          <AppBar position="static">
            <Toolbar>
              {props.goBack ? <IconButton edge="start" className={classes.menuButton} onClick={() => goBack()} color="inherit" aria-label="menu">
                <KeyboardBackspaceIcon />
              </IconButton> : null}
              <Typography variant="h6" className={classes.title}>
                {props.heading}
              </Typography>
              {props.rightSide}
            </Toolbar>
          </AppBar>
        </div>
      </div>
    </div>
  );
}
