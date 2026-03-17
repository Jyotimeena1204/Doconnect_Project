package com.doconnect.discussionservice.controller;

import com.doconnect.discussionservice.dto.LikeRequest;
import com.doconnect.discussionservice.model.Like;
import com.doconnect.discussionservice.service.LikeService;
import jakarta.validation.Valid;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.http.HttpStatus;
import org.springframework.http.ResponseEntity;
import org.springframework.web.bind.annotation.*;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

@RestController
@RequestMapping("/likes")
@CrossOrigin(origins = "*")
public class LikeController {
    
    @Autowired
    private LikeService likeService;
    
    @PostMapping
    public ResponseEntity<?> addLike(@Valid @RequestBody LikeRequest request) {
        try {
            Like like = likeService.addLike(request);
            return ResponseEntity.status(HttpStatus.CREATED).body(like);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    @DeleteMapping("/answer/{answerId}/user/{userId}")
    public ResponseEntity<?> removeLike(@PathVariable Long answerId, @PathVariable Long userId) {
        try {
            likeService.removeLike(answerId, userId);
            Map<String, String> response = new HashMap<>();
            response.put("message", "Like removed successfully");
            return ResponseEntity.ok(response);
        } catch (Exception e) {
            Map<String, String> error = new HashMap<>();
            error.put("error", e.getMessage());
            return ResponseEntity.badRequest().body(error);
        }
    }
    
    @GetMapping("/answer/{answerId}")
    public ResponseEntity<List<Like>> getLikesByAnswerId(@PathVariable Long answerId) {
        return ResponseEntity.ok(likeService.getLikesByAnswerId(answerId));
    }
    
    @GetMapping("/answer/{answerId}/count")
    public ResponseEntity<Map<String, Integer>> getLikesCount(@PathVariable Long answerId) {
        Map<String, Integer> response = new HashMap<>();
        response.put("count", likeService.getLikesCount(answerId));
        return ResponseEntity.ok(response);
    }
    
    @GetMapping("/answer/{answerId}/user/{userId}/check")
    public ResponseEntity<Map<String, Boolean>> hasUserLiked(@PathVariable Long answerId, @PathVariable Long userId) {
        Map<String, Boolean> response = new HashMap<>();
        response.put("hasLiked", likeService.hasUserLiked(answerId, userId));
        return ResponseEntity.ok(response);
    }
}