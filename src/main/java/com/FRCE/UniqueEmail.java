package com.FRCE;

import java.util.HashSet;
import java.util.Set;

import org.springframework.stereotype.Service;

/**
 * Unique email addresses means they will be delivered to the same account using Gmail account 
 * matching. Specifically: Gmail will ignore the placement of "." in the username. And it will 
 * ignore any portion of the username after a "+".
 * 
 * Examples
 * test.email@gmail.com,test.email+spam@gmail.com and testemail@gmail.com will all go to the same 
 * address, and thus the result should be 1.
 * test.email@gmail.com and test.email@fetchrewards.com are two different email addresses, and thus 
 * the result should be 2.
 * 
 * @author YiShiun Chang
 *
 */
@Service // Service is used so Spring MVC can initiate DataCenter as an object
public class UniqueEmail {
	
	/**
	 * This method returns the number of unique emails in a list.
	 * 
	 * @param emailsInput is a list of emails given by a user
	 * @return String value of the number of unique emails
	 */
	public String numUniqueEmails(String emailsInput) {
		String[] emails = emailsInput.split(",");
		// visit stores unique emails
		Set<String> visit = new HashSet<String>();
		// traverse through the list
    for (String email : emails) {
    	StringBuilder mail = new StringBuilder();
      boolean findAt = false; // @
      boolean findPlus = false; // +
          
      int i = 0;
      while (i < email.length()) {
        if (email.charAt(i) == '.' && !findAt) {
          i++;
          continue;
        } else if (email.charAt(i) == '+' && !findAt) {
          findPlus = true;
          i++;
          continue;
        } else if (findPlus && !findAt && email.charAt(i) != '@') {
          i++;
          continue;
        } else if (email.charAt(i) == '@') {
          findAt = true;
          mail.append(email.charAt(i++));
        } else {
          mail.append(email.charAt(i++));
        }
      }
          
      visit.add(mail.toString());
    }
        
    return String.valueOf(visit.size());
  }
}
