import React, { useCallback, useEffect, useState } from "react";
import Page from "../Page";
import { PersonDto } from "../../dto/person";
import api from "../../api/api";
import Button from "../../components/Button/Button";
import { FaPencil } from "react-icons/fa6";
import { FaTrashAlt } from "react-icons/fa";

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

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                    <th></th>
                </tr>
                {people.map(person => (
                    <React.Fragment key={person.PersonId}>
                        <tr>
                            <td>{person.FirstName}</td>
                            <td>{person.LastName}</td>
                            <td>{person.Email}</td>
                            <td>{person.PhoneNumber}</td>
                            <td>
                                <div className="center">
                                    <Button type="primary" small linkTo={`/edit-person/${person.PersonId}`}>
                                        <FaPencil />
                                    </Button>
                                    {/* TODO: delete confirmation modal, or page */}
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
                            </td>
                        </tr>
                    </React.Fragment>
                ))}
            </table>
        </Page>
    );
};

export default PersonList;
