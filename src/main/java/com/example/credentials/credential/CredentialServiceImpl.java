package com.example.credentials.credential;

import org.springframework.stereotype.Service;

@Service
public class CredentialServiceImpl implements CredentialService {

    private final CredentialRepository credentialRepository;
    private final CredentialMapper credentialMapper;

    public CredentialServiceImpl(CredentialRepository credentialRepository, CredentialMapper credentialMapper) {
        this.credentialRepository = credentialRepository;
        this.credentialMapper = credentialMapper;
    }

    @Override
    public void createCredential(CreateCredentialRequest request) {
        credentialRepository.save(credentialMapper.toEntity(request));
    }
}
