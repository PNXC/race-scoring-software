import axios from "axios";
import { PersonDto } from "../dto/person";

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

const api = {
    getPeople,
    getPerson,
};

export default api;
