import React, { useState } from 'react';
import ChipRadioGroup, { ChipRadioOption } from './components/ChipRadio/ChipRadio';

const RadioOptions: ChipRadioOption[] = [
    {
        backgroundColor: 'red',
        textColor: 'white',
        displayName: 'Red',
        identifier: 'red',
    },
    {
        backgroundColor: 'green',
        textColor: 'white',
        displayName: 'Green',
        identifier: 'green',
    },
    {
        backgroundColor: 'blue',
        textColor: 'white',
        displayName: 'Blue',
        identifier: 'blue',
    },
];

function App() {
    const [tempRadioOption, setTempRadioOption] = useState('green');
    const [tempRadioOptionsMulti, setTempRadioOptionsMulti] = useState(['green']);

    return (
        <div className="page">
            <h1>PNXC Race Scoring</h1>

            <ChipRadioGroup
                options={RadioOptions}
                onSelectSingle={setTempRadioOption}
                selected={tempRadioOption}
                className="ml-20"
            />

            <ChipRadioGroup
                options={RadioOptions}
                onSelectMulti={setTempRadioOptionsMulti}
                selected={tempRadioOptionsMulti}
                className="ml-20 mt-20"
                multiselect
                showCheckmark
            />
        </div>
    );
}

export default App;
