interface PageProps {
    title: string,
    children?: React.ReactNode,
}
// TODO: we can add navbars and whatnot if needed
const Page = ({ title, children }: PageProps) => {
    return (
        <div className="page">
            <h1>{title}</h1>
            {children}
        </div>
    );
};

export default Page;
