import React, { useCallback, useEffect, useState } from "react";
import Page from "../Page";
import { PersonDto } from "../../dto/person";
import api from "../../api/api";
import Button from "../../components/Button/Button";
import { FaPencil } from "react-icons/fa6";
import { FaTrashAlt } from "react-icons/fa";
import SortableTable from "../../components/SortableTable/SortableTable";
import Loader from "../../components/Loader/Loader";

const PersonList = () => {
    const [loading, setLoading] = useState(false);
    const [people, setPeople] = useState<PersonDto[]>([]);

    const loadPeople = useCallback(async () => {
        setLoading(true);
        const getPeopleResponse = await api.getPeople();
        setPeople(getPeopleResponse);
        setLoading(false);
    }, []);

    useEffect(() => {
        loadPeople();
    }, [loadPeople]);

    return (
        <Page title="People">
            <Button linkTo="/new-person">+ Create Person</Button>

            {/* TODO: delete confirmation modal, or page */}
            {loading ? (
                <Loader />
            ) : (
                <SortableTable
                    defaultSortedColumn="LastName"
                    data={people}
                    rowLink={(row) => `/person/${row.PersonId}`}
                    searchable
                    searchFilter={(query, row) => !!(
                        row.FirstName?.toLowerCase().includes(query.toLowerCase()) ||
                        row.LastName?.toLowerCase().includes(query.toLowerCase()) ||
                        row.Email?.toLowerCase().includes(query.toLowerCase()) ||
                        row.PhoneNumber?.toLowerCase().includes(query.toLowerCase())
                    )}
                    columns={[
                        {
                            title: 'First Name',
                            dataSource: 'FirstName',
                            sortable: true,
                        },
                        {
                            title: 'Last Name',
                            dataSource: 'LastName',
                            sortable: true,
                        },
                        {
                            title: 'Email',
                            dataSource: 'Email',
                        },
                        {
                            title: 'Phone Number',
                            dataSource: 'PhoneNumber',
                        },
                        {
                            title: '',
                            content: person => (
                                <div className="center">
                                    <Button type="primary" small linkTo={`/edit-person/${person.PersonId}`}>
                                        <FaPencil />
                                    </Button>
                                    <Button
                                        type="deny"
                                        small
                                        onClick={async () => {
                                            await api.deletePerson(person.PersonId);
                                            await loadPeople();
                                        }}
                                    >
                                        <FaTrashAlt />
                                    </Button>
                                </div>
                            )
                        }
                    ]}
                />
            )}
        </Page>
    );
};

export default PersonList;
