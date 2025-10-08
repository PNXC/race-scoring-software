import React from 'react';
import { BrowserRouter as Router, Routes, Route, Navigate } from 'react-router-dom';
import PersonList from './pages/Person/PersonList';
import EditPerson from './pages/Person/EditPerson';

function App() {
    return (
         <Router>
            <Routes>
                <Route index element={<Navigate to="/people" />} />
                <Route path="/people" element={<PersonList />} />
                <Route path="/edit-person/:personId" element={<EditPerson isEdit />} />
                <Route path="/new-person" element={<EditPerson />} />
            </Routes>
        </Router>
    );
}

export default App;
