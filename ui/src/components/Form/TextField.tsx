import { Setter } from "../../common";

interface TextFieldProps {
    name: string,
    value: string,
    setValue: Setter<string>,
    readOnly?: boolean,
}
const TextField = ({ name, value, setValue, readOnly }: TextFieldProps) => {
    return (
        <>
            <label className="mr-10">{name}:</label>
            <input
                disabled={readOnly}
                value={(readOnly && !value) ? '<blank>' : value}
                onChange={e => setValue(e.target.value)}
            />
        </>
    )
};

export default TextField;
