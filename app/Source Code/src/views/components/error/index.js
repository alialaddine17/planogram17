import React from 'react';
import WarningIcon from '@material-ui/icons/Warning';

export default function Error(props)
{
    return(
        <div className="col-12 text-center h-50 m-t-30 error" hidden={!props.value}>
            <WarningIcon />            
            <p>{props.value}</p>
        </div>
    )
}