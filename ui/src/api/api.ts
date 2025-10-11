import axios from "axios";
import { CreatePersonDto, PersonDto } from "../dto/person";

// Create an Axios instance
const client = axios.create({
    baseURL: "http://localhost:7071/api",
});


// TODO: proper state management with Redux

async function getPeople(): Promise<PersonDto[]> {
    const response = await client.get<PersonDto[]>('persons');
    return response.data;
}
async function getPerson(id: string | number): Promise<PersonDto> {
    const response = await client.get<PersonDto>(`persons/${id}`);
    return response.data;
}
async function createPerson(model: CreatePersonDto): Promise<PersonDto> {
    const response = await client.post<PersonDto>(`persons`, model);
    return response.data;
}
async function editPerson(id: string | number, model: CreatePersonDto): Promise<PersonDto> {
    const response = await client.put<PersonDto>(`persons/${id}`, model);
    return response.data;
}
async function deletePerson(id: string | number): Promise<void> {
    await client.delete(`persons/${id}`);
}


const api = {
    getPeople,
    getPerson,
    createPerson,
    editPerson,
    deletePerson,
};

export default api;
