package com.acg12.service;

import com.acg12.beans.Feedback;
import com.acg12.mapper.FeedbackMapper;
import com.acg12.mapper.UserMapper;
import com.acg12.service.base.FeedbackService;

import javax.annotation.Resource;

/**
 * Created by Administrator on 2017/6/21.
 */
public class FeedbackServiceImpl implements FeedbackService {

    @Resource
    private FeedbackMapper feedbackMapper;

    @Override
    public int save(Feedback feedback) throws Exception {
        return feedbackMapper.insert(feedback);
    }
}