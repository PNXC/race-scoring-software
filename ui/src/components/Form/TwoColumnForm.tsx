import './Form.css';

interface TwoColumnFormProps {
    children?: React.ReactNode,
}
const TwoColumnForm = ({ children }: TwoColumnFormProps) => {
    return (
        <div className="grid-2-col">
            {children}
        </div>
    )
};

export default TwoColumnForm
