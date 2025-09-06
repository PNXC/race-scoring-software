import { useCallback } from 'react';
import './ChipRadio.css';
import { Setter } from '../../common';

type ChipRadioIdentifier = string;
export interface ChipRadioOption {
    backgroundColor: string;
    textColor: string;
    displayName: string;
    identifier: ChipRadioIdentifier;
}
interface ChipRadioProps {
    options: ChipRadioOption[];
    selected: ChipRadioIdentifier | ChipRadioIdentifier[];
    onSelectSingle?: Setter<ChipRadioIdentifier>;
    onSelectMulti?: Setter<ChipRadioIdentifier[]>;
    className?: string;
    multiselect?: boolean;
    showCheckmark?: boolean;
}
function ChipRadioGroup({
    options,
    selected,
    onSelectSingle = () => {},
    onSelectMulti = () => {}, 
    className = '',
    multiselect = false,
    showCheckmark = false,
}: ChipRadioProps) {
    const onClick = useCallback((id: ChipRadioIdentifier) => {
        if (multiselect) {
            onSelectMulti((current: ChipRadioIdentifier[]) => {
                const next = [...current];
                if (next.includes(id)) {
                    const index = next.indexOf(id);
                    next.splice(index, 1);
                } else {
                    next.push(id);
                }
                return next;
            });
        } else {
            onSelectSingle(id);
        }
    }, [multiselect, onSelectSingle, onSelectMulti]);

    return (
        <div className={`chip-radio-group ${className}`}>
            {options.map((op, idx) => (
                <ChipRadioButton
                    key={idx}
                    option={op}
                    selected={typeof selected === 'string' ? op.identifier === selected : selected.includes(op.identifier)}
                    onSelect={onClick}
                    showCheckmark={showCheckmark}
                />
            ))}
        </div>
    );
}

interface ChipRadioButtonProps {
    option: ChipRadioOption;
    selected?: boolean;
    onSelect: (id: ChipRadioIdentifier) => void;
    showCheckmark?: boolean;
}
function ChipRadioButton({ option, selected = false, onSelect, showCheckmark = false, }: ChipRadioButtonProps) {
    return (
        <div
            className={`chip-radio-button ${selected ? 'selected' : ''}`}
            style={{
                backgroundColor: option.backgroundColor,
                color: option.textColor
            }}
            onClick={() => onSelect(option.identifier)}
        >
            {showCheckmark && <span className="checkmark">✓&nbsp;</span>}
            {option.displayName}
            {showCheckmark && <span className="checkmark-back">&nbsp;✓</span>}
        </div>
    )
}

export default ChipRadioGroup;
