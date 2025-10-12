import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import PersonList from './pages/Person/PersonList';
import EditPerson from './pages/Person/EditPerson';
import Page from './pages/Page';
import TabbableTable from './components/TabbableTable/TabbableTable';

type TempTabbableType = { firstName: string; lastName: string, racing: boolean };

function App() {
    const [testData, setTestData] = React.useState<TempTabbableType[]>([
        { firstName: 'test', lastName: 'user', racing: true },
        { firstName: 'test', lastName: 'user', racing: false },
        { firstName: 'test', lastName: 'user', racing: true },
        { firstName: 'test', lastName: 'user', racing: true },
        { firstName: 'test', lastName: 'user', racing: false },
        { firstName: 'test', lastName: 'user', racing: true },
    ]);

    return (
         <Router>
            <Routes>
                <Route index element={<Navigate to="/people" />} />
                <Route path="/people" element={<PersonList />} />
                <Route path="/edit-person/:personId" element={<EditPerson type="edit" />} />
                <Route path="/new-person" element={<EditPerson type="create" />} />
                <Route path="/person/:personId" element={<EditPerson type="readonly" />} />
                <Route path="/test" element={
                    <Page title="Test">
                        <TabbableTable
                            rows={testData}
                            setRows={setTestData}
                            columns={[
                                {
                                    title: 'First Name',
                                    key: 'firstName',
                                    readonly: true,
                                },
                                {
                                    title: 'Last Name',
                                    key: 'lastName',
                                },
                                {
                                    title: 'Racing?',
                                    key: 'racing',
                                    readonly: true,
                                },
                            ]}
                        />
                    </Page>
                } />
            </Routes>
        </Router>
    );
}

export default App;
