module ReassemblyModifier

# Write your package code here.
# Some notes
# I want to quickly make edits to wide sections of blocks with a couple of
# simple function calls.
# What does SF need to do?
# defineBlock( dump in your struct )
# features_set!
# features_append!
# features_remove!
# field_modify_multiply!
# field_modify_add!
# field_modify_set!
const FEATURES_KEY = "features"
const POINTS_KEY = "points"
const FACTION_KEY = "group"
const ID_KEY = "ident"

function features_set!(block, set_features)
    block[ FEATURES_KEY ] = set_features
    nothing
end

function features_append!(block, add_features)
    if !haskey( block, FEATURES_KEY )
        block[ FEATURES_KEY ] = add_features

        return nothing
    end

    if !( block[ FEATURES_KEY ] isa Array )
        block[ FEATURES_KEY ] = [ block[ FEATURES_KEY ] ]
    end

    append!( block[ FEATURES_KEY ], add_features )

    return nothing
end

function features_remove!(block, remove_features)
    if !haskey( block, FEATURES_KEY )
        error("Block has no features to remove!")

        return nothing
    end

    if block[ FEATURES_KEY ] isa Array
        filter!( e -> !(e in remove_features), block[ FEATURES_KEY ] )
    elseif ( block[ FEATURES_KEY ] in remove_features )
        delete!( block, FEATURES_KEY )
    end

    return nothing
end

function blocks_from_faction(blocks, faction)
    output = []

    for block in blocks
        if block[ FACTION_KEY ] == faction
            append!(block, output)
        end
    end

    return output
end

function blocks_from_id(blocks, range_id)
    output = []

    for block in blocks
        if ( block[ ID_KEY ] in range_id )
            append!( output, block )
        end
    end
end

function blocks_from_key(blocks, key, range)
    output = []

    for block in blocks
        if ( block[ key ] in range )
            append!( output, block )
        end
    end
end


end
