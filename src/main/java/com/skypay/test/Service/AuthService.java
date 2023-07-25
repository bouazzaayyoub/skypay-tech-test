package com.skypay.test.Service;

import com.skypay.test.Configuration.JwtService;
import com.skypay.test.Controller.AuthenticationResponse;
import com.skypay.test.Controller.AuthenticationRequest;
import com.skypay.test.Repositoriy.UserRepository;
import lombok.RequiredArgsConstructor;
import org.springframework.security.authentication.AuthenticationManager;
import org.springframework.security.authentication.UsernamePasswordAuthenticationToken;
import org.springframework.stereotype.Service;

@Service
@RequiredArgsConstructor
public class AuthService {

    private final JwtService jwtService;
    private final UserRepository userRepository;
    private final AuthenticationManager authenticationManager;
    public AuthenticationResponse login(AuthenticationRequest request) {
    authenticationManager.authenticate(new UsernamePasswordAuthenticationToken(request.getPhone(), request.getPassword()));
    var user = userRepository.findByPhoneNumber(request.getPhone()).orElseThrow();
    var jwt = jwtService.generateToken(user);
    return AuthenticationResponse.builder().token(jwt).build();
    }
}
