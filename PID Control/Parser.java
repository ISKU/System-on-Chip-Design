import java.util.Scanner;
import java.util.*;
import java.io.*;

public class Parser {
	public static void main(String... args) throws IOException {
		Scanner input = new Scanner(System.in);
		BufferedReader reader = new BufferedReader(new FileReader("data.txt"));
		BufferedWriter writer = new BufferedWriter(new FileWriter("result.txt"));
		String line = null;
		
		int id = 1;
		int count = 1;
		while ((line = reader.readLine()) != null) {
			if (id++ % 2 == 1)
				System.out.print(line + ",");
			else {
				line = line.replaceAll("Compute In: ", "").replaceAll(" Out: ", "");
				System.out.println(line);
			}
		}
	}
}