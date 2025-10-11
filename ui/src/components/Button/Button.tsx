import cx from 'classnames';
import './Button.css';

type ButtonType = 'primary' | 'secondary' | 'tertiary' | 'accept' | 'deny';
interface ButtonProps {
    onClick?: () => void,
    children?: React.ReactNode,
    type?: ButtonType,
    linkTo?: string | null,
    small?: boolean,
}
const Button = ({ 
    onClick = () => {},
    children,
    type = 'primary',
    linkTo = null,
    small = false
}: ButtonProps) => {
    if (linkTo) {
        return (
            <a href={linkTo}>
                <button className={cx(type, { small })}>
                    {children}
                </button>
            </a>
        );
    } else {
        return (
            <button className={cx(type, { small })} onClick={onClick}>
                {children}
            </button>
        );
    }
};

export default Button;
