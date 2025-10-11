import React, { useCallback, useEffect, useState } from "react";
import Page from "../Page";
import { PersonDto } from "../../dto/person";
import api from "../../api/api";
import Button from "../../components/Button/Button";
import { FaPencil } from "react-icons/fa6";
import { FaTrashAlt } from "react-icons/fa";
import SortableTable from "../../components/SortableTable/SortableTable";

const PersonList = () => {
    const [people, setPeople] = useState<PersonDto[]>([]);

    const loadPeople = useCallback(async () => {
        const getPeopleResponse = await api.getPeople();
        setPeople(getPeopleResponse);
    }, []);

    useEffect(() => {
        loadPeople();
    }, [loadPeople]);

    return (
        <Page title="People">
            <Button linkTo="/new-person">+ Create Person</Button>

            {/* TODO: delete confirmation modal, or page */}
            <SortableTable
                defaultSortedColumn="LastName"
                data={people}
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
        </Page>
    );
};

export default PersonList;
