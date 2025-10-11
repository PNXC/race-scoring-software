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
    const content = typeof children === 'string' ? <span>{children}</span> : children;

    if (linkTo) {
        return (
            <a href={linkTo}>
                <button className={cx(type, { small })}>
                    {content}
                </button>
            </a>
        );
    } else {
        return (
            <button className={cx(type, { small })} onClick={onClick}>
                {content}
            </button>
        );
    }
};

export default Button;
