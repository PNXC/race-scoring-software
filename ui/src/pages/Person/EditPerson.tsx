import { useCallback, useEffect, useState } from "react";
import Page from "../Page";
import api from "../../api/api";
import { useNavigate, useParams } from "react-router-dom";
import TextField from "../../components/Form/TextField";
import TwoColumnForm from "../../components/Form/TwoColumnForm";
import Button from "../../components/Button/Button";
import { IoCaretBack } from "react-icons/io5";
import Loader from "../../components/Loader/Loader";

interface EditPersonProps {
    type: 'readonly' | 'edit' | 'create';
}
const EditPerson = ({ type }: EditPersonProps) => {
    const navigate = useNavigate();
    const { personId } = useParams();
    const [firstName, setFirstName] = useState('');
    const [lastName, setLastName] = useState('');
    const [email, setEmail] = useState('');
    const [phoneNumber, setPhoneNumber] = useState('');
    const [loading, setLoading] = useState(false);

    useEffect(() => {
        async function load() {
            setLoading(true);
            const data = await api.getPerson(personId!);
            setFirstName(data.FirstName ?? '');
            setLastName(data.LastName ?? '');
            setEmail(data.Email ?? '');
            setPhoneNumber(data.PhoneNumber ?? '');
            setLoading(false);
        }

        if (type === 'edit' || type === 'readonly') {
            load();
        }
    }, [type, personId]);

    const submit = useCallback(async () => {
        // TODO: input validation?
        // TODO: if isEdit && !personId, should be some sort of error?
        const person = { FirstName: firstName, LastName: lastName, Email: email, PhoneNumber: phoneNumber };
        if (type === 'edit') {
            await api.editPerson(personId!, person);
        } else if (type === 'create') {
            await api.createPerson(person);
        }

        navigate('/people');
    }, [personId, firstName, lastName, email, phoneNumber, type, navigate]);

    return (
        <Page title={type === 'create' ? 'Create Person' : type === 'edit' ? 'Edit Person' : 'View Person'}>
            <Button linkTo="/people"><IoCaretBack /><span>Go Back</span></Button>

            {loading ? (
                <Loader />
            ) : (
                <TwoColumnForm>
                    <TextField readOnly={type === 'readonly'} name="First Name" value={firstName} setValue={setFirstName} />
                    <TextField readOnly={type === 'readonly'} name="Last Name" value={lastName} setValue={setLastName} />
                    <TextField readOnly={type === 'readonly'} name="Email" value={email} setValue={setEmail} />
                    <TextField readOnly={type === 'readonly'} name="Phone Number" value={phoneNumber} setValue={setPhoneNumber} />
                </TwoColumnForm>
            )}

            {type !== 'readonly' && <Button onClick={() => submit()}>{type === 'edit' ? 'Save' : 'Create'}</Button>}
        </Page>
    )
};

export default EditPerson;
