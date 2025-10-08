import { useEffect, useState } from "react";
import Page from "../Page";
import api from "../../api/api";
import { useParams } from "react-router-dom";
import TextField from "../../components/Form/TextField";
import TwoColumnForm from "../../components/Form/TwoColumnForm";
import Button from "../../components/Button/Button";

interface EditPersonProps {
    isEdit?: boolean;
}
const EditPerson = ({ isEdit = false }: EditPersonProps) => {
    const { personId } = useParams();
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [phoneNumber, setPhoneNumber] = useState('');

    useEffect(() => {
        async function load() {
            const data = await api.getPerson(personId!);
            setFirstName(data.FirstName ?? '');
            setLastName(data.LastName ?? '');
            setEmail(data.Email ?? '');
            setPhoneNumber(data.PhoneNumber ?? '');
        }

        if (isEdit) {
            load();
        }
    }, [isEdit, personId]);

    return (
        <Page title={isEdit ? 'Edit Person' : 'Create Person'}>
            <TwoColumnForm>
                <TextField name="First Name" value={firstName} setValue={setFirstName} />
                <TextField name="Last Name" value={lastName} setValue={setLastName} />
                <TextField name="Email" value={email} setValue={setEmail} />
                <TextField name="Phone Number" value={phoneNumber} setValue={setPhoneNumber} />
            </TwoColumnForm>

            <Button>{isEdit ? 'Save' : 'Create'}</Button>
        </Page>
    )
};

export default EditPerson;
