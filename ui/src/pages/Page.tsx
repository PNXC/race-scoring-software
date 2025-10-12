interface PageProps {
    title: string,
    icon?: React.ReactNode,
    children?: React.ReactNode,
}
// TODO: we can add navbars and whatnot if needed
const Page = ({ title, icon, children }: PageProps) => {
    return (
        <div className="page">
            <h1>
                <span>{icon}</span>
                <span>{title}</span>
            </h1>
            {children}
        </div>
    );
};

export default Page;
