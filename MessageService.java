package com.doconnect.discussionservice.dto;

import jakarta.validation.constraints.NotNull;
import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class LikeRequest {
    
    @NotNull(message = "Answer ID is required")
    private Long answerId;
    
    @NotNull(message = "User ID is required")
    private Long userId;
}