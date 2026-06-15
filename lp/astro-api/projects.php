<?php

require_once __DIR__ . '/../bpcore/db-connect.php';
require_once __DIR__ . '/../bpcore/sqltransaction.php';

header('Content-Type: application/json');

$projects = extractRecord(
    'id,title,content,imageurl,type,ref_id',
    'status',
    1,
    'projects'
);

$response = [];

$parents = [];
$children = [];

// Separate parents and children
foreach ($projects as $project) {

    if ($project['type'] == 1) {

        $project['children'] = [];

        $parents[$project['id']] = $project;

    } elseif ($project['type'] == 2) {

        $children[] = $project;
    }
}

// Map children to parents using ref_id
foreach ($children as $child) {

    $parentId = $child['ref_id'];

    if (isset($parents[$parentId])) {

        $parents[$parentId]['children'][] = $child;
    }
}

// Re-index array
$response = array_values($parents);

// Output JSON
echo json_encode([
    'status' => true,
    'data' => $response
], JSON_PRETTY_PRINT);

?>