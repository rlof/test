
import java.util.*;

Ball ball1;
Ball ball2;
Ball ball3;
Ball ball4;
Ball ball5;
Ball ball6;
Ball ball7;
Ball ball8;
Ball ball9;
Ball ball10;
Ball ball11;
Ball ball12;
Ball ball13;

float gravity = 0.5;  

List<Word> words;

PFont font = createFont("Arial", 32);
PFont font2 = createFont("times", 32);


int rando;

void setup() {
  size(700,700);  
  
  ball1 = new Ball(10,10,32);
  ball2 = new Ball(60,50,64);
  ball3 = new Ball(110,100,124);
  ball4 = new Ball(170,240,16);
  ball5 = new Ball(220,340,32);
  ball6 = new Ball(270,510,56);
  ball7 = new Ball(320,450,78);
  ball8 = new Ball(370,240,67);
  ball9 = new Ball(450,80,52);
  ball10 = new Ball(500,60,34);
  ball11 = new Ball(550,380,11);
  ball12 = new Ball(580,500,88);
  ball13 = new Ball(67,300,56);
 
  Map<String, List<String>> wordMap = loadInWords("words.txt"); 
  
  for (String k : wordMap.keySet()) {
   // println("key = " + k); 
  
    List<String> values = wordMap.get(k);
  
    for (String v : values) {
     // println("\tvalue = " + v);
     
     
    }   
  }
  
  
  words = parseGrammar(wordMap, "grammar.txt");
}


/*** 
  Loads in a text file indicating words assoicated with parts of speech, parses it, 
  and returns a Map of each part of speech and its assoicated List of words.
  Assumes each line looks like:

    POS:word1,word2,...,wordN
***/  
Map<String, List<String>> loadInWords(String filename) {
  
  Map<String, List<String>> m = new HashMap<String, List<String>>();
  
  String[] lines = loadStrings(filename);
  
  for (int i = 0 ; i < lines.length; i++) {
    //println(lines[i]);
    String[] chop = split(lines[i], ':');
    
    String POS = chop[0];
    String wordsStr = chop[1];
    //println("\tLEFT SIDE = " + POS);
    //println("\tRIGHT SIDE = " + wordsStr + "\n");
    
    String[] wordsArr = split(wordsStr, ','); //split right side into an array of Strings
    List<String> wordsList = Arrays.asList(wordsArr); //turns array into a List
    
    
   
    for (String tmpStr : wordsList) {
      //println("\t\tword= "+tmpStr);
    }
    
    
    m.put(POS, wordsList);
  }
  
  return m;
}


/***
  Reads through a text file of parts of speech and looks through a Map m for a random word 
  that corresponds to each part of speech. Returns a populated List of Word objects, where
  each type of Word has its own render() method.
***/

List<Word> parseGrammar( Map<String, List<String>> m, String filename) {
  
  List<Word> ws = new ArrayList<Word>();
  // TO DO - 
  // 1. Load in Strings from "grammar.txt" and loop through each line.
  String[] lines = loadStrings(filename);
  
  
  for(String line : lines) {
    println(line); 
    
    String[] posArr = line.split(" ");
    List<String> posList = Arrays.asList(posArr); //turns array into a List
    
    for (String p : posList) {
      //println("\t" + p);
      
      List<String> listOfWords = m.get(p);
      
      int randNum = (int) random(0,listOfWords.size());
       
      String randomWord = listOfWords.get( randNum );
      println("\t\t" + randomWord);
      
      
      
      Word w;
      if (p.equals("NOUN")) {
        w = new WordNoun(randomWord, p);
      } else {
        w = new Word(randomWord, p);
      }
      
      ws.add(w);
      
    }
  }
  
  
  // 2. For each POS in the line, get the associated List of words from Map m.
  // 3. Choose a random word from the list.
  // 4. Place this word in a List that we will read from in the draw() loop. 
  
  return ws;
 }



void draw() {
   background(0,0,0); 
   smooth();
   
   ball1.display();
   ball2.display();
   ball3.display();
   ball4.display();
   ball5.display();
   ball6.display();
   ball7.display();
   ball8.display();
   ball9.display();
   ball10.display();
   ball11.display();
   ball12.display();
   ball13.display();
   
   ball1.update();
   ball2.update();
   ball3.update();
   ball4.update();
   ball5.update();
   ball6.update();
   ball7.update();
   ball8.update();
   ball9.update();
   ball10.update();
   ball11.update();
   ball12.update();
   ball13.update();
   
   
   int pX = 10;
   int pY = 100;
   
  for (Word w : words) {
     w.render(pX, pY);
     
     int sw = (int)textWidth(w.word);
     pX += sw + 10;
     
     if (pX + sw > width) {
       pX = 10;
       pY += 100;
       rando=(int)random(0,255);
        
     }
   }
}
  



