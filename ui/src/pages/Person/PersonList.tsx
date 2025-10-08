import React, { useEffect, useState } from "react";
import Page from "../Page";
import { PersonDto } from "../../dto/person";
import api from "../../api/api";
import Button from "../../components/Button/Button";

const PersonList = () => {
    const [people, setPeople] = useState<PersonDto[]>([]);

    useEffect(() => {
        async function run() {
            const getPeopleResponse = await api.getPeople();
            setPeople(getPeopleResponse);
        }
        
        run();
    }, []);

    return (
        <Page title="People">
            <Button>+ Create Person</Button>

            <table>
                <tr>
                    <th>First Name</th>
                    <th>Last Name</th>
                    <th>Email</th>
                    <th>Phone Number</th>
                </tr>
                {people.map(person => (
                    <React.Fragment key={person.PersonId}>
                        <tr>
                            <td>{person.FirstName}</td>
                            <td>{person.LastName}</td>
                            <td>{person.Email}</td>
                            <td>{person.PhoneNumber}</td>
                        </tr>
                    </React.Fragment>
                ))}
            </table>
        </Page>
    );
};

export default PersonList;
