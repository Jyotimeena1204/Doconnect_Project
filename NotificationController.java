package com.doconnect.discussionservice.controller;

import com.doconnect.discussionservice.dto.AnswerRequest;
import com.doconnect.discussionservice.model.Answer;
import com.doconnect.discussionservice.service.AnswerService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/answers")
@CrossOrigin(origins = "*")
public class AnswerController {
    
    @Autowired
    private AnswerService answerService;
    
    @PostMapping
    public ResponseEntity<?> createAnswer(@Valid @RequestBody AnswerRequest request) {
        try {
            Answer answer = answerService.createAnswer(request);
            return ResponseEntity.status(HttpStatus.CREATED).body(answer);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    @GetMapping
    public ResponseEntity<List<Answer>> getAllAnswers() {
        return ResponseEntity.ok(answerService.getAllAnswers());
    }
    
    @GetMapping("/question/{questionId}")
    public ResponseEntity<List<Answer>> getAnswersByQuestionId(@PathVariable Long questionId) {
        return ResponseEntity.ok(answerService.getAnswersByQuestionId(questionId));
    }
    
    @GetMapping("/pending")
    public ResponseEntity<List<Answer>> getPendingAnswers() {
        return ResponseEntity.ok(answerService.getPendingAnswers());
    }
    
    @GetMapping("/{id}")
    public ResponseEntity<?> getAnswerById(@PathVariable Long id) {
        try {
            Answer answer = answerService.getAnswerById(id);
            return ResponseEntity.ok(answer);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.status(HttpStatus.NOT_FOUND).body(error);
        }
    }
    
    @GetMapping("/user/{userId}")
    public ResponseEntity<List<Answer>> getAnswersByUserId(@PathVariable Long userId) {
        return ResponseEntity.ok(answerService.getAnswersByUserId(userId));
    }
    
    @PutMapping("/{id}/approve")
    public ResponseEntity<?> approveAnswer(@PathVariable Long id) {
        try {
            Answer answer = answerService.approveAnswer(id);
            return ResponseEntity.ok(answer);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    @PutMapping("/{id}/reject")
    public ResponseEntity<?> rejectAnswer(@PathVariable Long id) {
        try {
            Answer answer = answerService.rejectAnswer(id);
            return ResponseEntity.ok(answer);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    @DeleteMapping("/{id}")
    public ResponseEntity<?> deleteAnswer(@PathVariable Long id) {
        try {
            answerService.deleteAnswer(id);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Answer deleted successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
}