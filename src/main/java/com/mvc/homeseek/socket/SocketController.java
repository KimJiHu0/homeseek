package com.mvc.homeseek.socket;


 


import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;

 
@Controller
public class SocketController {
    
  
    private  Logger logger = LoggerFactory.getLogger(SocketController.class);
  
    @RequestMapping(value="/chat.do")
    public String getChatViewPage() {
        logger.info("chat.do");
        return "multiChat";
    }
   
}


