class Node
{
  Node parent = null;
  
  // F = total costs of the node
  float f;
  
  // G = distance from current node to the start node
  float g;
  
  // H = heuristic, the estimated distance from the current node to the target
  float h;
  
  
  // TODO: refactor PVector including dist
  int x;
  int y;
  
  Node(Node parent, int x, int y)
  {
    this.parent = parent;
    this.x = x;
    this.y = y;
    this.g = 0.0f;
    this.h = 0.0f;
    this.f = 0.0f;
  }
}
