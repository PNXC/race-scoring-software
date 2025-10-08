import { BaseDto } from "./base";

export interface CreatePersonDto {
    FirstName: string | null,
    LastName: string | null,
    Email: string | null,
    PhoneNumber: string | null,
}

export type PersonDto = {
    PersonId: number,
} & CreatePersonDto & BaseDto;
