import React, { useCallback, useEffect, useRef, useState } from "react";
import Page from "../Page";
import { PersonDto } from "../../dto/person";
import api from "../../api/api";
import { FaPencil } from "react-icons/fa6";
import { FaTrashAlt, FaUser } from "react-icons/fa";
import Loader from "../../components/Loader/Loader";
import { Button, IconButton, TextField } from "@mui/material";
import { Link } from "react-router-dom";
import useKeybind from "../../hooks/useKeybind";
import { FaSearch } from "react-icons/fa";
import { DataGrid, GridColDef } from '@mui/x-data-grid';

const columns: GridColDef[] = [
    { field: 'FirstName', headerName: 'First Name', width: 180 },
    { field: 'LastName', headerName: 'Last Name', width: 180 },
    { field: 'Email', headerName: 'Email', sortable: false, width: 180 },
    { field: 'PhoneNumber', headerName: 'Phone Number', sortable: false,  width: 180 },
    {
        field: 'actions',
        headerName: '',
        width: 180,
        sortable: false,
        align: 'center',
        renderCell: (params) => (
            <>
                <IconButton color="info" size="small" component={Link} to={`/edit-person/${params.row.PersonId}`}>
                    <FaPencil />
                </IconButton>
                <IconButton
                    size="small"
                    color="error"
                    onClick={async () => {
                        await api.deletePerson(params.row.PersonId);
                        // await loadPeople();
                    }}
                >
                    <FaTrashAlt />
                </IconButton>
            </>
        ),
    }
];

const PersonList = () => {
    const [loading, setLoading] = useState(false);
    const [people, setPeople] = useState<PersonDto[]>([]);

    const [searchQuery, setSearchQuery] = useState('');
    const searchRef = useRef<HTMLInputElement>(null);

    const loadPeople = useCallback(async () => {
        setLoading(true);
        const getPeopleResponse = await api.getPeople();
        setPeople(getPeopleResponse);
        setLoading(false);
    }, []);

    useEffect(() => {
        loadPeople();
    }, [loadPeople]);

    useKeybind('f', true, () => {
        searchRef.current?.focus();
    });

    return (
        <Page title="People" icon={<FaUser />}>
            <Button variant="contained" component={Link} to="/new-person" sx={{ mb: 2, mt: 2 }}>
                + Create Person
            </Button>

            {/* TODO: delete confirmation modal, or page */}
            {loading ? (
                <Loader />
            ) : (
                <div>
                    <TextField
                        inputRef={searchRef}
                        label="Search"
                        value={searchQuery}
                        onChange={e => setSearchQuery(e.target.value)}
                        sx={{ mb: 2 }}
                        variant="standard"
                        slotProps={{
                            input: {
                                startAdornment: <FaSearch />,
                            },
                        }}
                    />
                    <DataGrid
                        rows={people}
                        columns={columns}
                        initialState={{ pagination: { paginationModel: { page: 0, pageSize: 50 }} }}
                        getRowId={(row) => row.PersonId}
                        disableRowSelectionOnClick
                    />
                </div>
            )}
        </Page>
    );
};

export default PersonList;
