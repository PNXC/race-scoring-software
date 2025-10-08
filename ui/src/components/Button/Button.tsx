import './Button.css';

type ButtonType = 'primary' | 'secondary' | 'tertiary' | 'accept' | 'deny';
interface ButtonProps {
    onClick?: () => void,
    children?: React.ReactNode,
    type?: ButtonType,
}
const Button = ({ onClick = () => {}, children, type = 'primary' }: ButtonProps) => {
    return (
        <button className={type} onClick={onClick}>
            {children}
        </button>
    )
};

export default Button;
