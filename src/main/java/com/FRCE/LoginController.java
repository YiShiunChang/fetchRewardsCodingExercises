package com.FRCE;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

@Controller
public class LoginController {
  @Autowired
  PyramidWord pw;
  @Autowired
  UniqueEmail ue;
  
  /**
   * fetchRewards is the only page of this coding exercise
   * 
   * @return ksr
   */
  @RequestMapping(value = "fetchRewards", method = RequestMethod.GET)
  public String showPage() {
    return "fetchRewards";
  }
  
  /**
   * This method checks whether a word is a pyramid or not.
   * 
   * @param word is what user types in fetchRewards.jsp
   * @return String of whether a word is a pyramid or not.
   */
  @RequestMapping(value = "isPyramid", method = RequestMethod.POST)
  @ResponseBody
  public String answerPyramid(@RequestParam String word) {
	if (pw.isPyramid(word)) {
		return " is a pyramid.";
	}
    return " isn't a pyramid.";
  }
  
  /**
   * This method returns the number of unique emails in a list of emails.
   * 
   * @param emails is a list of emails.
   * @return String value of the number of unique emails
   */
  @RequestMapping(value = "getUnique", method = RequestMethod.POST)
  @ResponseBody
  public String anwerUnique(@RequestParam String emails) {
    return "This list has " + ue.numUniqueEmails(emails) + " unique emails.";
  }
}