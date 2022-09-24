# frozen_string_literal: true

# Add shops to subdivision and ubdate old Subdivisions with related Shops
# in case when Subdivision has name like "KM123 Logistics" and Shop has number like "KM123"
class AddShopToSubdivision < ActiveRecord::Migration[6.0]
  def up
    add_reference :subdivisions, :shop, type: :uuid, foreign_key: true, index: true

    execute <<-SQL
      UPDATE subdivisions
      SET shop_id = correlation.shopid
      FROM
        (SELECT shops_codes.id AS shopid, subdivisions_codes.id AS subdivisionid
        FROM
          (SELECT id, (REGEXP_MATCH(name, '^KM\\d+'))[3] AS code_subdivision
            FROM subdivisions) AS subdivisions_codes
        INNER JOIN
          (SELECT id, (REGEXP_MATCH(number, '^KM\\d+'))[3] AS code_shop
            FROM shops) AS shops_codes ON code_subdivision = code_shop) AS correlation
      WHERE subdivisions.id = correlation.subdivisionid;
    SQL
  end

  def down
    remove_reference :subdivisions, :shop, foreign_key: true
  end
end

