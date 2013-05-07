/*
 * SimpleMazeGame.java
 * Copyright (c) 2008, Drexel University.
 * All rights reserved.
 *
 * Redistribution and use in source and binary forms, with or without
 * modification, are permitted provided that the following conditions are met:
 *     * Redistributions of source code must retain the above copyright
 *       notice, this list of conditions and the following disclaimer.
 *     * Redistributions in binary form must reproduce the above copyright
 *       notice, this list of conditions and the following disclaimer in the
 *       documentation and/or other materials provided with the distribution.
 *     * Neither the name of the Drexel University nor the
 *       names of its contributors may be used to endorse or promote products
 *       derived from this software without specific prior written permission.
 *
 * THIS SOFTWARE IS PROVIDED BY DREXEL UNIVERSITY ``AS IS'' AND ANY
 * EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO, THE IMPLIED
 * WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR PURPOSE ARE
 * DISCLAIMED. IN NO EVENT SHALL DREXEL UNIVERSITY BE LIABLE FOR ANY
 * DIRECT, INDIRECT, INCIDENTAL, SPECIAL, EXEMPLARY, OR CONSEQUENTIAL DAMAGES
 * (INCLUDING, BUT NOT LIMITED TO, PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES;
 * LOSS OF USE, DATA, OR PROFITS; OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND
 * ON ANY THEORY OF LIABILITY, WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT
 * (INCLUDING NEGLIGENCE OR OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS
 * SOFTWARE, EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
 */
package maze;

import java.io.BufferedReader;
import java.io.FileNotFoundException;
import java.io.FileReader;
import java.io.IOException;
import java.util.ArrayList;

import maze.ui.MazeViewer;

/**
 * 
 * @author Sunny
 * @version 1.0
 * @since 1.0
 */
public class SimpleMazeGame
{
	/**
	 * Creates a small maze.
	 */
	public static Maze createMaze()
	{	
		Maze maze = new Maze();
		Room a = new Room(0);
		Room b = new Room(1);
		
		maze.addRoom(a);
		maze.addRoom(b);
		
		a.setSide(Direction.East, b);
		//System.out.println("The maze does not have any rooms yet!");
		
		return maze;
	}

	public static Maze loadMaze(final String path)
	{
		Maze maze = new Maze();
		ArrayList<Room> rooms = new ArrayList<Room>();
		ArrayList<Door> doors = new ArrayList<Door>();
		
		if(path.length() > 0){
			
			BufferedReader br;
			try {
				br = new BufferedReader(new FileReader(path));
				String line;
				while ((line = br.readLine()) != null) {
				   // process the line.
					String[] input = line.split("\\s");
					if(input[0].equals("room")){
						rooms.add(new Room(Integer.parseInt(input[1])));
						maze.addRoom(rooms.get(rooms.size()-1));
						
						
						
					} else if(input[0].equals("door")){
						Door door = new Door(rooms.get(Integer.parseInt(input[2])), rooms.get(Integer.parseInt(input[3])));
						if(input[4].equals("open")){
							door.setOpen(true);
						} else if(input[4].equals("close")){
							door.setOpen(false);
						}
						doors.add(door);
					} else {
						System.out.println(input[0]);
					}
				}
				br.close();
				
				@SuppressWarnings("resource")
				BufferedReader br2 = new BufferedReader(new FileReader(path));
				String line2;
				while((line2 = br2.readLine()) != null){
					String[] input2 = line2.split("\\s");
					if(input2[0].equals("room")){
						
						for(int i=2;i<=5;i++){
							if(input2[i].equals("wall")){
								rooms.get(rooms.size()-1).setSide(getDirection(i-1), new Wall());
							} else if(input2[i].matches("d[0-9][0-9]*")){
								rooms.get(Integer.parseInt(input2[1])).setSide(getDirection(i-1),doors.get(Integer.parseInt(input2[i].substring(1))));
							} else if(input2[i].matches("[0-9][0-9]*")){
								rooms.get(Integer.parseInt(input2[1])).setSide(getDirection(i-1),rooms.get(Integer.parseInt(input2[i].substring(1))));
							}
						}
						
						
					} else {
						System.out.println("error");
					}

				}
			} catch (FileNotFoundException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			} catch (IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}

		} else {
			System.out.println("Please load a maze from the file!");
		}
		return maze;
	}
	public static Direction getDirection(int i){
		switch(i){
		case 1:
			return Direction.North;
		case 2:
			return Direction.South;
		case 3:
			return Direction.East;
		case 4:
			return Direction.West;
		default:
			return null;
		}
	}
	public static void main(String[] args)
	{
		
		//Maze maze = createMaze();
		Maze maze = loadMaze("small.maze");
	    MazeViewer viewer = new MazeViewer(maze);
	    viewer.run();
	}
}
