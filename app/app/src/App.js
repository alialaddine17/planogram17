import React , {useState} from 'react';

//App Components
import MainApp from './views';

//Material-UI Components
import { createMuiTheme, ThemeProvider } from '@material-ui/core/styles';

//CSS
import './App.css';

const theme = createMuiTheme({
  direction: 'rtl', // Both here and <body dir="rtl">
  palette: {
    primary: {
      main: 'rgb(218, 218, 218)',
    },
    secondary: {
      main: '#ec407a',
    },
  },

});

function App() {

  const [rtl,setRtl] =  useState(localStorage.getItem('rtl'));

  function setRtlValue(value) {
    localStorage.setItem('rtl',value);
    setRtl(value);
  }

  return (
    
      <ThemeProvider theme={theme}>
        <div dir={rtl} className={"App "+ rtl }>
          <MainApp setRtl={(value)=>setRtlValue(value)}  />
        </div>
      </ThemeProvider>
    
  );
}

export default App;
