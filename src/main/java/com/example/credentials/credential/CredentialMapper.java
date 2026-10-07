package com.example.credentials.credential;

import org.springframework.stereotype.Component;

@Component
public class CredentialMapper {

    public Credential toEntity(CreateCredentialRequest request) {
        return new Credential(request.getId(), request.getPassword());
    }
}
