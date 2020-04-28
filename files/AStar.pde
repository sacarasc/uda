class AStar
{
  ArrayList<Node> openList = new ArrayList<Node>();
  ArrayList<Node> closedList = new ArrayList<Node>();
  
  float calculateDistance(int aX, int aY, int bX, int bY)
  {
    float distanceX = aX - bX;
    float distanceY = aY - bY;
    
    if ( distanceY < 0){
      distanceY *= -1;
    }
    
    if ( distanceX < 0){
      distanceX *= -1;
    }
    
    // missing sqrt on easy distance, this is correct
    // lost float precisions, this is correct
    float easyDistance = pow(distanceX,2) + pow(distanceY,2);
    return easyDistance;
  }
  
  Node findPositionOnList(ArrayList<Node> list, int x, int y)
  {
    if ( list != null && list.size() > 0)
    {
      for ( int i=0; i<list.size(); i++)
      {
        Node check = list.get(i);
        if ( check.x == x && check.y == y)
        {
          return check;
        }
      }
    }
    return null;
  }
  
  void path(int field[][], int startX, int startY, int endX, int endY)
  {
    // put the startNode on the openList (leave it's f at zero)
    Node start = new Node(null, startX, startY);
    start.f = 0;
    openList.add(start);

    //while the openList is not empty
    while( openList.size() > 0)
    {
      // Get the current node
      Node current = null;
      int removed = -1;
      for ( int i=0; i<openList.size(); i++)
      {
        //let the currentNode equal the node with the least f value
        Node temp = openList.get(i);
        if ( current == null || temp.f < current.f) {
          current = temp;
          removed = i;
        }
      }
      
      if ( current == null)
      {
        //something went wrong, abort
        break;
      }
        
      //remove the currentNode from the openList
      openList.remove(removed);
      
      //add the currentNode to the closedList
      closedList.add(current);
      
      //if currentNode is the goal
      if ( current.x == endX && current.y == endY)
      {
        //Congratz! You've found the end! Backtrack to get path
        
        // backtrack from the closed list
        while ( current.parent != null) //<>//
        {
          field[current.x][current.y] = 2;
          current = current.parent;
        }

        return;
      }
      
      // Generate children
      ArrayList<Node> children = new ArrayList<Node>();
      for ( int x = -1; x<=1; x++) {
        for ( int y = -1; y<=1; y++) {
          
          // do not generate children for the position of the current node
          if ( x == 0 && y == 0) {
            continue;
          }
          
          int childX = x+current.x;
          int childY = y+current.y;
          
          //check boundaries, skip if not in boundaries of the field
          if ( childX < 0 || childX >= fieldX || childY < 0 || childY >= fieldY) {
            continue;
          }
          
          // add children to children list
          children.add(new Node(current, childX, childY));
        }
      }
      
      //for each child in the children
      for ( int i=0; i<children.size(); i++)
      {
        Node child = children.get(i);
        
        //if child is in the closedList
        Node foundChild = findPositionOnList(closedList, child.x, child.y);
        if ( foundChild != null)
        {
          //    continue to beginning of for loop
          continue;
        }
        
        // Create the f, g, and h values
        //currentNode.g + distance between child and current
        float distanceChildParent = calculateDistance(child.x, child.y, child.parent.x, child.parent.y);
        child.g = child.parent.g + distanceChildParent;
        
        //child.h = distance from child to end
        float distanceChildEnd = calculateDistance(child.x, child.y, endX, endY);
        child.h = distanceChildEnd;

        //child.f = child.g + child.h
        child.f = child.g + child.h;
        
        // Child is already in openList
        //if child.position is in the openList's nodes positions
        foundChild = findPositionOnList(openList, child.x, child.y);
        //    if the child.g is higher than the openList node's g
        if ( foundChild != null && child.g >= foundChild.g) {
          //        continue to beginning of for loop
          continue;
        }
        
        //add the child to the openList
        openList.add(child);
      }
        
    }
  }
    
}
