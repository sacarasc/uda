#include <iostream>
#include <vector>
using std::cout;
using std::endl;
using std::vector;

int VectorAddition(vector<int> v)  {
    int sum = 0;
    for ( int i : v) {
        sum += i;
    }
    return sum;
}

int main (){
    cout << "Hello!" << "\n";

    //datatypes
    int x=9;
    std::string y;
    y="hello world string!";
    cout << x << endl;
    cout << y << endl;

    //vector 1d
    vector<int> v_1{1,2,3};
    vector<int> v_2 = {4,5,6};
    vector<int> v_3;
    v_3 = {7};

    cout << v_1[0] <<endl;
    cout << v_1[1] <<endl;
    cout << v_1[2] <<endl;
    cout << v_1.size() << "=length" <<endl;

    //vector 2d
    vector<vector<int>> v4_2d1 {{1,2},{3,4}};

    cout << v4_2d1[0][0] << endl;
    cout << v4_2d1[0].size() << "=2d length element 0" << endl;

    //auto
    auto i=9;
    auto va = {1,2,3};

    cout << "for with increment" << endl;
    for( int i=0; i<3; i++) {
        cout << i <<endl;
    }

    cout << "for with vector" << endl;
    vector<int> for_vector = {7,6,5};
    for ( int i : for_vector) {
        cout << i << endl;
    }

    cout << "for with 2d vector" << endl;
    vector<vector<int>> b {{1, 2},
                           {3, 4},
                           {5, 6}};

    for ( vector<int>  vv : b) { 
        for ( int i : vv) {
            cout << i << endl;
        }
    }

    cout << "vector additions" << endl;
    int sum = VectorAddition(for_vector);
    cout << "sum:" << sum << endl;



    return 0;
}