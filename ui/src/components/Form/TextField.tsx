import { Setter } from "../../common";

interface TextFieldProps {
    name: string,
    value: string,
    setValue: Setter<string>,
}
const TextField = ({ name, value, setValue }: TextFieldProps) => {
    return (
        <>
            <label className="mr-10">{name}:</label>
            <input value={value} onChange={e => setValue(e.target.value)} />
        </>
    )
};

export default TextField;
