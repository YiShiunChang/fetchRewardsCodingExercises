package com.FRCE;

import java.util.HashMap;
import java.util.Map;

import org.springframework.stereotype.Service;

/**
 * Accept a string as input and return a response indicating whether a word is a pyramid word.
 * A word is a pyramid word if you can arrange the letters in increasing frequency, starting with 
 * 1 and continuing without gaps and without duplicates.
 * 
 * Examples
 * banana is a pyramid word because you have 1 'b', 2 'n's, and 3 'a's.
 * bandana is not a pyramid word because you have 1 'b' and 1 'd'.
 * 
 * @author YiShiun Chang
 */
@Service // Service is used so Spring MVC can initiate DataCenter as an object
public class PyramidWord {
	
	/**
	 * This method checks whether a word is a pyramid.
	 * 
	 * @param word given by a user
	 * @return true if the give word is a pyramid 
	 */
	public boolean isPyramid(String word) {
		// an empty word is not a pyramid
		if (word.length() == 0) {
			return false;
		}
		// count the occurrences of each character
		Map<Character, Integer> char_to_count = new HashMap<Character, Integer>();
		for (int i = 0; i < word.length(); i++) {
			char_to_count.put(word.charAt(i), char_to_count.getOrDefault(word.charAt(i), 0) + 1);
		}
		// fits is an array to fit the layer of a pyramid, ex. (a, 1), (z,2), (c,3) is a 3 layers
		// pyramid, so fits = [false, false, false, false] when it is initialized
		int charsNum = char_to_count.size();
		boolean[] fits = new boolean[charsNum + 1];
		// each char and layer should have a bijection relationship, otherwise, return false
		for (char key : char_to_count.keySet()) {
			int count = char_to_count.get(key);
			if (count >= fits.length) { // the highest layer equals to the number of unique chars
				return false;
			} else if (fits[count]) { // duplicated chars at the same layer is not allowed
				return false;
			} else {
				fits[count] = true;
			}
		}
		// a layer should map to exactly one char 
		for (int i = 1; i < fits.length; i++) {
			if (!fits[i]) {
				return false;
			}
		}
		
		return true;
	}
}
