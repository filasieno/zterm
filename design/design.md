# Zterm

Key data structures
 - StringPool 
 - NodePool   PNode
 - IdSet      INode, DNode
 - IdMap      INode, DNode
 - TreeMap    INode, DNode
 - TreeSet    INode, DNode
 

------------------------


Id: Signature  S 
    Type       T 
    Cons       C 
    Entity     E 
    Attrtibute A 
    Value      V
    TypedValue Vx

Symbol
   sym  -> Text | IdSet SymId -> Text
   Text -> sym  | HashMap Text -> sym

Signature
    sym -> S      | HashSet sym -> S        | unique signature name
    S -> name     | IdMap S -> sym          | signature name
    S -> T        | IdMap S -> IdSet T      | all cons in a Type
    T -> S        | IdMap T -> S            | parent signature of a type 
    
Type
    S sym -> T    | IdMap S -> IdMap sym -> T | unique type name
    T -> sym      | IdMap T -> sym            | type name
    T -> C        | IdMap T -> IdSet C        | all cons in a Type
    C -> T        | IdMap C -> T              | parent type of a cons

Cons
    T sym -> C    | HashSet T sym -> C      | unique cons name in a type
    C -> sym      | IdSet C -> sym          | cons name
    C -> E        | IdSet C -> * BTree E    | all entities in a Cons
    E -> C        | IdSet E -> C            | parent const of an entity

Core EAV:
    E:RowID -> A:RowId V:RowId       | HashMap entityId -> ArrayList(struct(a: AttrId, v: ValueId)) | given an entity, return all (attribute, value) pairs 
    V -> AE       | Btree V -> (A, E) | given a value, return all (attribute, entity) pairs
    A -> EV       | Btree A -> (E, V) | given an attribute, return all (entity, value) pairs
    A -> VA       | Btree A -> (V, A) | given an attribute, return all (entity, value) pairs

Core EiV:
    E -> iV       | IdSet E  -> Vec V  | given an entity, return all indexed values
    V -> iE       | IdSet V  -> IdMap i -> IdSet iE  | given a value, return all entities that index value at i 

Values:
    V -> Vx       | IdSet V  -> Vx          | given a value               -> its value type and typed value id
    Vx -> ival    | IdSet Vx -> ival        | given a typed value id      -> the internalized value  
    ival -> V     | HashSet ival -> V       | given an internalized value -> return its value 

ZStratego DML:
    newS    sym
    newT    sym S
    newC    sym T
    newE    C 
    newV    val
    Put     E A V
    Rem     S
    Rem     T
    Rem     C
    Rem     E
    Rem     E A
    Rem     E A V
    Upd     E E
    UpdT    E T
    CClear  E
    CPop    E
    CIns    E i V
    CPush   E V
    CRem    E i
    CUpd    E i V



ZStratego UndoRedo:
    for each commands define an LogRec

Load the JSON LSP to ZStratego

ZStratego Trasform AST

ZStratego Query AST

