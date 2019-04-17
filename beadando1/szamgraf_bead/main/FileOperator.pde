import java.io.*;
import java.util.Random; 
 
class FileOperator{
  FileOperator(int io, ArrayList<Shape> shapes){
    if(io == 0){
      println("Saving...");
      try{
        Random rand = new Random(); 
        rand.nextInt(40);
        String filename = "draw" + rand + ".txt";
        /*FileOutputStream f = new FileOutputStream(new File(filename));
        ObjectOutputStream o = new ObjectOutputStream(f);
        for(Shape s:shapes){
          o.writeObject(s);
        }
        
        o.close();
        f.close();
        println("Saved into: " + filename);
      */
        FileOutputStream fout = new FileOutputStream(filename);
        ObjectOutputStream oos = new ObjectOutputStream(fout);
        oos.writeObject(shapes);
        oos.close();
        fout.close();      
    } catch (FileNotFoundException e) {
          System.out.println("ERROR: File not found"); 
      } catch (NotSerializableException e) {
          println("ERROR: trying to serialize: ");
          e.printStackTrace();
      } catch (IOException e) {
          println("ERROR: initializing stream");
          e.printStackTrace(); 
      }/* catch (ClassNotFoundException e) {
          println("ERROR: Class not found.");
          e.printStackTrace();
      }*/

    }else{
      //beolvasás ugy hogy kilistázzuk az összes nekünk megefelelő kezdőju fájlt és sorsázmozzuk és várjuk rá a választást
    }
  }
}
